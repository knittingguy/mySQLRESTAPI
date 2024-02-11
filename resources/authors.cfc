component extends="taffy.core.resource" taffy_uri="/authors" {

    function get(){
        var authorQry = queryExecute("SELECT * FROM authors", { }, {datasource="bookDB", returnType="struct" })
        return rep( authorQry['resultset'] );
    }

    function post(
        required string authorName,
        required string nationality,
        required string authorurl
    ){
        var authorQry = queryExecute("INSERT INTO authors (authorName, nationality, authorURL) VALUES (:authorName, :nationality, :authorURL)", { authorName=arguments.authorName, nationality=arguments.nationality, authorURL=arguments.authorurl }, {datasource="bookDB", returnType="struct" })
       // return rep( bookQry['resultset'] );
       // return rep( bookQry );
    }
}