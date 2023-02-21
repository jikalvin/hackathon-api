module.exports = {
    // Resolve the list of notes for a user when requested
    // courses: async (user, args, { models }) => {
    //   return await models.Course.find({ instructor: user._id }).sort({ _id: -1 });
    // },
    // Resolve the list of favorites for a user when requested
    courses: async (user, args, { models }) => {
      return await models.Course.find({ takenBy: user._id }).sort({ _id: -1 });
    }
  };
  