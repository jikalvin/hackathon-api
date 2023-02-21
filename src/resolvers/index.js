const Query = require('./query');
const Mutation = require('./mutation');
const Course = require('./course')
const Module = require('./module')
const { GraphQLDateTime } = require('graphql-iso-date');

module.exports = {
  Query,
  Mutation,
  Course,
  Module,
  DateTime: GraphQLDateTime
};
