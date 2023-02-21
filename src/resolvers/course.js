module.exports = {
    // Resolve the author info for a note when requested
    instructor: async (course, args, { models }) => {
      return await models.User.findById(course.instructor);
    },
    // Resolved the favoritedBy info for a note when requested
    takenBy: async (course, args, { models }) => {
      return await models.User.find({ _id: { $in: course.takenBy } });
    },
  };
  