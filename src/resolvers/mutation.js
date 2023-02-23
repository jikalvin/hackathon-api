const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const {
  AuthenticationError,
  ForbiddenError
} = require('apollo-server-express');
const mongoose = require('mongoose');
require('dotenv').config();

const gravatar = require('../util/gravatar');

module.exports = {
  newCourse: async (parent, args, { models, user }) => {
    if (!user) {
      throw new AuthenticationError('You must be signed in to create a note');
    }
    if(user.status === 'student') {
      throw new ForbiddenError('You must be an instructor to create a course')
    }

    return await models.Course.create({
      name: args.name,
      instructor: mongoose.Types.ObjectId(user.id),
      numberOfStudents: 0
    });
  },
  deleteCourse: async (parent, { id }, { models, user }) => {
    // if not a user, throw an Authentication Error
    if (!user) {
      throw new AuthenticationError('You must be signed in to delete a note');
    }

    // find the note
    const course = await models.Course.findById(id);
    if (course && String(course.author) !== user.id) {
      throw new ForbiddenError("You don't have permissions to delete the note");
    }

    try {
      await course.remove();
      return true;
    } catch (err) {
      return false;
    }
  },
  enrolCourse: async (parent, { id }, { models, user }) => {
    // if no user context is passed, throw auth error
    if (!user) {
      throw new AuthenticationError();
    }

    let courseCheck = await models.Course.findById(id);
    const hasUser = courseCheck.takenBy.indexOf(user.id);

    if (hasUser >= 0) {
      return await models.Course.findByIdAndUpdate(
        id,
        {
          $pull: {
            takenBy: mongoose.Types.ObjectId(user.id)
          },
          $inc: {
            numberOfStudents: -1
          }
        },
        {
          // Set new to true to return the updated doc
          new: true
        }
      );
    } else {
      // if the user doesn't exists in the list
      // add them to the list and increment the favoriteCount by 1
      return await models.Course.findByIdAndUpdate(
        id,
        {
          $push: {
            takenBy: mongoose.Types.ObjectId(user.id)
          },
          $inc: {
            numberOfStudents: 1
          }
        },
        {
          new: true
        }
      );
    }
  },
  newModule: async (parent, args, { models, user }) => {
    if (!user) {
      throw new AuthenticationError('You must be signed in to create a note');
    }
    if(user.status === 'student') {
      throw new ForbiddenError('You must be an instructor to create a course')
    }

    return await models.Module.create({
      name: args.name,
      moduleOf: mongoose.Types.ObjectId(args.courseId),
      linkPdf: args.linkPdf,
      linkVideo: args.linkVideo,
    });
  },
  signUp: async (parent, { username, email, firstName, lastName, status, password }, { models }) => {
    // normalize email address
    email = email.trim().toLowerCase();
    // hash the password
    const hashed = await bcrypt.hash(password, 10);
    // create the gravatar url
    const avatar = gravatar(email);
    try {
      const user = await models.User.create({
        username,
        email,
        firstName,
        lastName,
        avatar,
        status,
        password: hashed
      });

      // create and return the json web token
      return jwt.sign({ id: user._id }, process.env.JWT_SECRET);
    } catch (err) {
      // if there's a problem creating the account, throw an error
      throw new Error('Error creating account');
    }
  },

  signIn: async (parent, { username, email, password }, { models }) => {
    if (email) {
      // normalize email address
      email = email.trim().toLowerCase();
    }

    const user = await models.User.findOne({
      $or: [{ email }, { username }]
    });

    // if no user is found, throw an authentication error
    if (!user) {
      throw new AuthenticationError('Error signing in');
    }

    // if the passwords don't match, throw an authentication error
    const valid = await bcrypt.compare(password, user.password);
    if (!valid) {
      throw new AuthenticationError('Error signing in');
    }

    // create and return the json web token
    return jwt.sign({ id: user._id }, process.env.JWT_SECRET);
  }
};
