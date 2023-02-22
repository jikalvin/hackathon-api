import 'package:graphql_flutter/graphql_flutter.dart';

/// Create client
final GraphQLClient gqlClient = GraphQLClient(
  /// url for graphql
    link: HttpLink('http://localhost:4000/api'),
    cache: GraphQLCache(
      /// Store the cache data
      store: HiveStore(),
    ),
);