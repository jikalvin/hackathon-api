// Require the mongose library
const mongoose = require('mongoose');

const courseSchema = new mongoose.Schema(
  {
    name: {
      type: String,
      required: true
    },
    instructor: {
      type: mongoose.Schema.Types.ObjectId,
      ref: 'User',
      required: true
    },
    numberOfStudents: {
      type: Number,
      default: 0
    },
    takenBy: [
      {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'User'
      }
    ]
  },
  {
    timestamps: true
  }
);

// Define the 'Course' model with the schema
const Course = mongoose.model('Course', courseSchema);
// Export the module
module.exports = Course;
