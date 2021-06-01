const users = [
  {
    user: 'mongo',
    pwd: 'mongo',
    roles: [
      {
        role: 'dbOwner',
        db: 'flask-graphql'
      },
      {
        role: 'dbOwner',
        db: 'flask-graphql-dev'
      }
    ]
  }
];

for (var i = 0, length = users.length; i < length; ++i) {
  db.createUser(users[i]);
}