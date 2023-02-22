module.exports = {
    moduleOf: async (module, args, { models }) => {
      return await models.Course.find({ _id: { $in: module.moduleOf } });
    },
  };
  