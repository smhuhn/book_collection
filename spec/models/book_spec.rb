require 'rails_helper'

RSpec.describe Book, type: :model do

  #
  # VALID BOOK
  #
  it "is valid with all required attributes" do
    book = Book.new(
      title: "The Hobbit",
      author: "J.R.R. Tolkien",
      price: 10.99,
      published_date: Date.new(1937, 9, 21)
    )

    expect(book).to be_valid
  end

  #
  # TITLE VALIDATION
  #
  it "is not valid without a title" do
    book = Book.new(
      author: "J.R.R. Tolkien",
      price: 10.99,
      published_date: Date.new(1937, 9, 21)
    )

    expect(book).not_to be_valid
    expect(book.errors[:title]).to include("can't be blank")
  end

  #
  # AUTHOR VALIDATION
  #
  it "is not valid without an author" do
    book = Book.new(
      title: "The Hobbit",
      price: 10.99,
      published_date: Date.new(1937, 9, 21)
    )

    expect(book).not_to be_valid
    expect(book.errors[:author]).to include("can't be blank")
  end

  #
  # PRICE VALIDATION
  #
  it "is not valid without a price" do
    book = Book.new(
      title: "The Hobbit",
      author: "J.R.R. Tolkien",
      published_date: Date.new(1937, 9, 21)
    )

    expect(book).not_to be_valid
    expect(book.errors[:price]).to include("can't be blank")
  end

  it "is not valid with a non-numerical price" do
    book = Book.new(
      title: "The Hobbit",
      author: "J.R.R. Tolkien",
      price: "abc",
      published_date: Date.new(1937, 9, 21)
    )

    expect(book).not_to be_valid
    expect(book.errors[:price]).to include("is not a number")
  end

  #
  # PUBLISHED DATE VALIDATION
  #
  it "is not valid without a published date" do
    book = Book.new(
      title: "The Hobbit",
      author: "J.R.R. Tolkien",
      price: 10.99
    )

    expect(book).not_to be_valid
    expect(book.errors[:published_date]).to include("can't be blank")
  end

end
