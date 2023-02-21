module.exports = {
    moduleOf: async (module, args, { models }) => {
      return await models.Course.findById(module.moduleOf);
    },
  };
  