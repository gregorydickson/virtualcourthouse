import net.rcenergy.Book
import net.rcenergy.BookTypes
import net.rcenergy.District
import net.rcenergy.Image
import net.rcenergy.USState
import net.rcenergy.User
import net.rcenergy.InstrumentTypes

class BootStrap {

	def init = { servletContext ->
		environments {
			production {
				// only create test data if there is no data in DB
				if (USState.count() == 0) {

					// create some users
					new User(username : "userX", password: "pass123", salt : "salt", dateCreated : new Date(), enabled : true).save(failOnError : true);
					new User(username : "userY", password: "pass123", salt : "salt", dateCreated : new Date(), enabled : true).save(failOnError : true);

					// create booktypes
					def bookType1 = new BookTypes(bookType : "WARRANTY DEED").save(failOnError : true);
					def bookType2 = new BookTypes(bookType : "LIEN").save(failOnError : true);
					def bookType3 = new BookTypes(bookType : "DOCUMENT").save(failOnError : true);
					// create instrument types
					def instrumentType1 = new InstrumentTypes(instrumentType : "DOCUMENT").save(failOnError : true);
					def instrumentType2 = new InstrumentTypes(instrumentType : "OIL AND GAS LEASE").save(failOnError : true);
					def instrumentType3 = new InstrumentTypes(instrumentType : "WARRANTY DEED").save(failOnError : true);
					// create a state
					def state = new USState(name: "OKLAHOMA", layout: "layout").save(failOnError: true);

					// create a state
					def state2 = new USState(name: "OHIO", layout: "layout").save(failOnError: true);
					def district3 = new District(name: "MEIGS", usstate: state2).save(failOnError: true);

					// create districts
					def district1 = new District(name: "OKLAHOMA", usstate: state).save(failOnError: true);
					def district2 = new District(name: "POTTAWATOMIE", usstate: state).save(failOnError: true);

					// create books
					def book1 = new Book(identifer : "BOOK1", booktype : bookType1).save(failOnError : true);
					def book2 = new Book(identifer : "BOOK2", booktype : bookType1).save(failOnError : true);
					def book3 = new Book(identifer : "BOOK3", booktype : bookType2).save(failOnError : true);

					// bind books to districts
					district1.books = new ArrayList<Book>();
					district1.books.add(book1);
					district1.books.add(book2);
					district1.books.add(book3);
					district1.merge();

					district2.books = new ArrayList<Book>();
					district2.books.add(book1);
					district2.merge();

					district3.books = new ArrayList<Book>();
					district3.books.add(book2);
					district3.books.add(book3);
					district3.merge();
					
					// create some images
					def img1 = new Image(dateLoaded : new Date(), image: new File("testImages/image1.png").bytes, bookNumber: 1, pageNumber : 1, fileName: "45837403.png").save(failOnError : true);
					def img2 = new Image(dateLoaded : new Date(), image: new File("testImages/image2.png").bytes, bookNumber: 1, pageNumber : 2, fileName: "45837404.png").save(failOnError : true);
					def img3 = new Image(dateLoaded : new Date(), image: new File("testImages/image3.png").bytes, bookNumber: 1, pageNumber : 3, fileName: "45837405.png").save(failOnError : true);
					def img4 = new Image(dateLoaded : new Date(), image: new File("testImages/image4.png").bytes, bookNumber: 1, pageNumber : 4, fileName: "45837406.png").save(failOnError : true);
					def img5 = new Image(dateLoaded : new Date(), image: new File("testImages/image4.png").bytes, bookNumber: 2, pageNumber : 1, fileName: "45837407.png").save(failOnError : true);
					def img6 = new Image(dateLoaded : new Date(), image: new File("testImages/image4.png").bytes, bookNumber: 2, pageNumber : 2, fileName: "45837408.png").save(failOnError : true);
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
					def img7 = new Image(dateLoaded : new Date(), image: new File("testImages/image1.png").bytes, fileName: "45837409.png").save(failOnError : true).save(failOnError : true);
					def img8 = new Image(dateLoaded : new Date(), image: new File("testImages/image2.png").bytes, fileName: "45837410.png").save(failOnError : true).save(failOnError : true);
					def img9 = new Image(dateLoaded : new Date(), image: new File("testImages/image3.png").bytes, fileName: "45837411.png").save(failOnError : true).save(failOnError : true);
					def img10 = new Image(dateLoaded : new Date(), image: new File("testImages/image4.png").bytes, fileName: "45837412.png").save(failOnError : true).save(failOnError : true);
				}
			}
			development {

				// only create test data if there is no data in DB
				if (USState.count() == 0) {

					// create some users
					new User(username : "userX", password: "pass123", salt : "salt", dateCreated : new Date(), enabled : true).save(failOnError : true);
					new User(username : "userY", password: "pass123", salt : "salt", dateCreated : new Date(), enabled : true).save(failOnError : true);

					// create booktypes
					def bookType1 = new BookTypes(bookType : "WARRANTY DEED").save(failOnError : true);
					def bookType2 = new BookTypes(bookType : "LIEN").save(failOnError : true);
					def bookType3 = new BookTypes(bookType : "DOCUMENT").save(failOnError : true);
					def bookType4 = new BookTypes(bookType : "WARRANTY DEED TWO").save(failOnError : true);
					def bookType5 = new BookTypes(bookType : "WARRANTY DEED THREE").save(failOnError : true);
					def bookType6 = new BookTypes(bookType : "WARRANTY DEED FOUR").save(failOnError : true);
					// create instrument types
					def instrumentType1 = new InstrumentTypes(instrumentType : "DOCUMENT").save(failOnError : true);
					def instrumentType2 = new InstrumentTypes(instrumentType : "OIL AND GAS LEASE").save(failOnError : true);
					def instrumentType3 = new InstrumentTypes(instrumentType : "WARRANTY DEED").save(failOnError : true);
					// create a state
					def state = new USState(name: "OKLAHOMA", layout: "layout").save(failOnError: true);

					// create a state
					def state2 = new USState(name: "OHIO", layout: "layout").save(failOnError: true);
					def district3 = new District(name: "MEIGS", usstate: state2).save(failOnError: true);

					// create districts
					def district1 = new District(name: "OKLAHOMA", usstate: state).save(failOnError: true);
					def district2 = new District(name: "POTTAWATOMIE", usstate: state).save(failOnError: true);

					// create books
					def book1 = new Book(identifer : "BOOK1", booktype : bookType1).save(failOnError : true);
					def book2 = new Book(identifer : "BOOK2", booktype : bookType1).save(failOnError : true);
					def book3 = new Book(identifer : "BOOK3", booktype : bookType2).save(failOnError : true);

					// bind books to districts
					district1.books = new ArrayList<Book>();
					district1.books.add(book1);
					district1.books.add(book2);
					district1.books.add(book3);
					district1.merge();

					district2.books = new ArrayList<Book>();
					district2.books.add(book1);
					district2.merge();

					district3.books = new ArrayList<Book>();
					district3.books.add(book2);
					district3.books.add(book3);
					district3.merge();
					
					// create some images
					def img1 = new Image(dateLoaded : new Date(), image: new File("testImages/image1.png").bytes, bookNumber: 1, pageNumber : 1, fileName: "45837403.png").save(failOnError : true);
					def img2 = new Image(dateLoaded : new Date(), image: new File("testImages/image2.png").bytes, bookNumber: 1, pageNumber : 2, fileName: "45837404.png").save(failOnError : true);
					def img3 = new Image(dateLoaded : new Date(), image: new File("testImages/image3.png").bytes, bookNumber: 1, pageNumber : 3, fileName: "45837405.png").save(failOnError : true);
					def img4 = new Image(dateLoaded : new Date(), image: new File("testImages/image4.png").bytes, bookNumber: 1, pageNumber : 4, fileName: "45837406.png").save(failOnError : true);
					def img5 = new Image(dateLoaded : new Date(), image: new File("testImages/image4.png").bytes, bookNumber: 2, pageNumber : 1, fileName: "45837407.png").save(failOnError : true);
					def img6 = new Image(dateLoaded : new Date(), image: new File("testImages/image4.png").bytes, bookNumber: 2, pageNumber : 2, fileName: "45837408.png").save(failOnError : true);
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
					def img7 = new Image(dateLoaded : new Date(), image: new File("testImages/image1.png").bytes, fileName: "45837409.png").save(failOnError : true).save(failOnError : true);
					def img8 = new Image(dateLoaded : new Date(), image: new File("testImages/image2.png").bytes, fileName: "45837410.png").save(failOnError : true).save(failOnError : true);
					def img9 = new Image(dateLoaded : new Date(), image: new File("testImages/image3.png").bytes, fileName: "45837411.png").save(failOnError : true).save(failOnError : true);
					def img10 = new Image(dateLoaded : new Date(), image: new File("testImages/image4.png").bytes, fileName: "45837412.png").save(failOnError : true).save(failOnError : true);
					
				}
			}
		}
	}
	def destroy = {
	}
}
