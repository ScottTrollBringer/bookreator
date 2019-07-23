# bookreator

To have it works properly you need:
- Haskell / Stack
- Elm 0.19
- Neo4j 3.5.6+

At the moment you need to create a database with some nodes, you can find sample queries that will build a basic structure with some data in `RequestsCypher.txt` at the root of this repository.

In V0.5 these actions will not be needed anymore as there will be an administration page to create those nodes.

You need to set 3 environment variables:
- GRAPHENEDB_BOLT_PASSWORD: the password of your Neo4j database
- GRAPHENEDB_BOLT_USER: the user of your Neo4j database
- GRAPHENEDB_BOLT_URL: its URL. If you use it on your computer, it is localhost.

To run tests you need:
- Test Cafe: `npm install -g testcafe`

You can access 2 URLs:
- Reading part: http://localhost:8080
- Administration: http://localhost:8080/admin
