import net.rcenergy.Book
import net.rcenergy.BookTypes
import net.rcenergy.District
import net.rcenergy.Image
import net.rcenergy.USState

class BootStrap {

	def init = { servletContext ->
		environments {
			production {
			}
			development {

				// only create test data if there is no data in DB
				if (USState.count() == 0) {
					// create booktypes
					def bookType1 = new BookTypes(bookType : "Warranty Deed").save(failOnError : true);
					def bookType2 = new BookTypes(bookType : "bookType2").save(failOnError : true);

					// create a state
					def state = new USState(name: "Oklahoma", layout: "layout").save(failOnError: true);

					// create districts
					def district1 = new District(name: "Oklahoma", usstate: state).save(failOnError: true);
					def district2 = new District(name: "Pottawatomie", usstate: state).save(failOnError: true);

					// create books
					def book1 = new Book(identifer : "book1", booktype : bookType1).save(failOnError : true);
					def book2 = new Book(identifer : "book2", booktype : bookType1).save(failOnError : true);
					def book3 = new Book(identifer : "book3", booktype : bookType2).save(failOnError : true);

					// bind books to districts
					district1.books = new ArrayList<Book>();
					district1.books.add(book1);
					district1.books.add(book2);
					district1.books.add(book3);
					district1.merge();

					district2.books = new ArrayList<Book>();
					district2.books.add(book1);
					district2.merge();

					// create some images
					def img1 = new Image(dateLoaded : new Date(), image: new File("testImages/image1.tiff").bytes, bookNumber: 1, pageNumber : 1).save(failOnError : true);
					def img2 = new Image(dateLoaded : new Date(), image: new File("testImages/image2.tiff").bytes, bookNumber: 1, pageNumber : 2).save(failOnError : true);
					def img3 = new Image(dateLoaded : new Date(), image: new File("testImages/image3.tiff").bytes, bookNumber: 1, pageNumber : 3).save(failOnError : true);
					def img4 = new Image(dateLoaded : new Date(), image: new File("testImages/image4.tiff").bytes, bookNumber: 1, pageNumber : 4).save(failOnError : true);
					def img5 = new Image(dateLoaded : new Date(), image: new File("testImages/image4.tiff").bytes, bookNumber: 2, pageNumber : 1).save(failOnError : true);
					def img6 = new Image(dateLoaded : new Date(), image: new File("testImages/image4.tiff").bytes, bookNumber: 2, pageNumber : 2).save(failOnError : true);
					// bind images to books, an image will be in only one book
					book1.images = new ArrayList<Image>();
					book1.images.add(img1);
					book1.images.add(img2);
					book1.images.add(img3);
					book1.merge();

					book2.images = new ArrayList<Image>();
					book2.images.add(img5);
					book2.images.add(img6);
					book2.merge();

									
					//images with no book (some counties will not have books just images)
					//def img7 = new Image(dateLoaded : new Date(), image: new File("testImages/image1.tiff").bytes, pageNumber : 1).save(failOnError : true).save(failOnError : true);
					//def img8 = new Image(dateLoaded : new Date(), image: new File("testImages/image2.tiff").bytes, pageNumber : 2).save(failOnError : true).save(failOnError : true);
					//def img9 = new Image(dateLoaded : new Date(), image: new File("testImages/image3.tiff").bytes, pageNumber : 3).save(failOnError : true).save(failOnError : true);
					//def img10 = new Image(dateLoaded : new Date(), image: new File("testImages/image4.tiff").bytes, pageNumber : 4).save(failOnError : true).save(failOnError : true);
					
				}
			}
		}
	}
	def destroy = {
	}
}
