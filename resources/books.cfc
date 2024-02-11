component extends="taffy.core.resource" taffy_uri="/books" {

    function get(){
        var bookQry = queryExecute("SELECT idbooks, title, isbn, yearPublished FROM books", { }, {datasource="bookDB", returnType="struct" })
        return rep( bookQry['resultset'] );
    }

    function post(
        required string title,
   //     required numeric authorid,
        required string isbn,
        required numeric yearPublished
    ){
        queryExecute("INSERT INTO books (title, authorid, isbn, yearPublished) VALUES (:title, :author, :isbn, :yearPublished)", { title=arguments.title, author=1, isbn=arguments.isbn, yearPublished=arguments.yearPublished }, {datasource="bookDB" })
        var bookQry1 = queryExecute("SELECT idbooks, title, isbn, yearPublished FROM books WHERE title = :title and isbn = :isbn and yearPublished = :yearPublished", { title=arguments.title, isbn=arguments.isbn, yearPublished=arguments.yearPublished }, {datasource="bookDB", returnType="struct" })

   
        return rep( bookQry1['resultset'] );
       // return rep( bookQry );
    }
}