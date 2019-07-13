# bookreator

To have it works properly you need:
- Haskell / Stack
- Elm 0.19
- Neo4j 3.5.6+

V0.1 specifics: you need to create a database with 2 kind of nodes:
- Book, with only 1 field "title"
- Page, with 2 fields "content" and "numero"
- In V0.5 these actions will not be needed anymore as there will be an administration page to create those nodes.

You need to set 3 environment variables:
- GRAPHENEDB_BOLT_PASSWORD: the password of your Neo4j database
- GRAPHENEDB_BOLT_USER: the user of your Neo4j database
- GRAPHENEDB_BOLT_URL: its URL. If you use it on your computer, it is localhost.

To run tests you need:
- Test Cafe: `npm install -g testcafe`