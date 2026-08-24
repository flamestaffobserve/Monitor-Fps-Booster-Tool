local Library = {}
Library.__index = Library

function Library:new()
    return setmetatable({ books = {} }, self)
end

function Library:addBook(title, author, year)
    table.insert(self.books, {
        title = title,
        author = author,
        year = year
    })
end

function Library:printCatalog()
    print("Library Catalog")
    print("================")

    table.sort(self.books, function(a, b)
        return a.year < b.year
    end)

    for _, book in ipairs(self.books) do
        print(string.format("%d | %s | %s", book.year, book.title, book.author))
    end
end

local library = Library:new()

library:addBook("The Hobbit", "J. R. R. Tolkien", 1937)
library:addBook("Foundation", "Isaac Asimov", 1951)
library:addBook("Dune", "Frank Herbert", 1965)
library:addBook("The Martian", "Andy Weir", 2011)

library:printCatalog()
