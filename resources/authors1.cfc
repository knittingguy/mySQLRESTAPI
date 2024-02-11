component extends="taffy.core.resource" taffy_uri="/authors/{authorid}" {

    function get(){
        var authorQry = queryExecute("SELECT * FROM authors WHERE idauthor = :id", 
        { id: arguments.authorid }, 
        {datasource="bookDB", returnType="struct" })
        return rep( authorQry['resultset'] );
    }

}