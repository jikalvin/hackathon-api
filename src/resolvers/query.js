module.exports = {
    courses: async (parent, args, { models }) => {
      return await models.Course.find().limit(100);
    },
    course: async (parent, args, { models }) => {
      return await models.Course.findById(args.id);
    },
    user: async (parent, args, { models }) => {
      return await models.User.findOne({ username: args.username });
    },
    users: async (parent, args, { models }) => {
      return await models.User.find({}).limit(100);
    },
    me: async (parent, args, { models, user }) => {
      return await models.User.findById(user.id);
    },
  };
  