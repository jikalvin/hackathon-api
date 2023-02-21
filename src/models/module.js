// Require the mongose library
const mongoose = require('mongoose');

const moduleSchema = new mongoose.Schema(
  {
    name: {
      type: String,
      required: true
    },
    moduleOf: {
      type: mongoose.Schema.Types.ObjectId,
      ref: 'Course'
    },
    linkPdf: {
        type: String,
        required: true
    },
    linkVideo: {
        type: String,
        required: true
    }
  },
  {
    timestamps: true
  }
);

const Module = mongoose.model('Module', moduleSchema);
// Export the module
module.exports = Module;
