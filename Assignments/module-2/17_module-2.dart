class Book {
  String title;
  String author;
  int publicationYear;

  Book(this.title, this.author, this.publicationYear);

  void displayDetails() {
    print('Title: $title');
    print(' Author: $author');
    print('Published: $publicationYear');
  }

  bool isOver10YearsOld() {
    int currentYear = DateTime.now().year;
    return currentYear - publicationYear > 10;
  }
}

void main() {
  Book myBook = Book('The Alchemist', 'Paulo Coelho', 2005);
  myBook.displayDetails();

  if (myBook.isOver10YearsOld()) {
    print('This book is over 10 years old.');
  } else {
    print('This book is less than 10 years old.');
  }
}
/*
Title: The Alchemist
 Author: Paulo Coelho
Published: 2005
This book is over 10 years old.
 */