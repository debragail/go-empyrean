psql -U postgres -d shyftdbtest -f $GOPATH/src/github.com/ShyftNetwork/go-empyrean/shyftdb/postgres_setup_test/drop_tables_test.psql
psql -U postgres -d shyftdbtest -f $GOPATH/src/github.com/ShyftNetwork/go-empyrean/shyftdb/postgres_setup_test/create_tables_test.psql