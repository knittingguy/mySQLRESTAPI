component extends="taffy.core.resource" taffy_uri="/books/{bookid}" {

    function get(){
        var bookQry = queryExecute("SELECT idbooks, title, isbn, yearPublished FROM books WHERE idbooks = :id", 
        { id: arguments.bookid }, 
        {datasource="bookDB", returnType="struct" })
        return rep( bookQry['resultset'] );
    }

}