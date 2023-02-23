const { gql } = require('apollo-server-express');

module.exports = gql`
  scalar DateTime

  type User {
    id: ID!
    username: String!
    email: String!
    firstName: String!
    lastName: String!
    avatar: String
    status: String!
    courses: [Course!]!
  }

  type Course {
    id: ID!
    name: String!
    instructor: User
    numberOfStudents: Int!
    takenBy: [User!]!
    modules: [Module]
  }

  type Module {
    id: ID!
    name: String!
    linkPdf: String!
    linkVideo: String!
    moduleOf: Course!
  }

  type Query {
    user(username: String!): User
    users: [User!]!
    me: User!
    courses: [Course!]!
    course(id: ID): Course!
    modules: [Module!]!
  }

  type Mutation {
    newCourse(name: String!): Course!
    deleteCourse(id: ID!): Boolean!
    enrolCourse(id: ID!): Course!
    newModule(name: String!, linkPdf: String!, linkVideo:String!, courseId:String!): Module!
    deleteModule(id: String!): Boolean!
    signUp(username: String!, firstName: String!, lastName:String!,  email: String!, status: String!, password: String!): String!
    signIn(username: String, email: String, password: String!): String!
  }
`;
