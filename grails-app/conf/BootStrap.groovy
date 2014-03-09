import net.rcenergy.Book
import net.rcenergy.BookTypes
import net.rcenergy.District
import net.rcenergy.Image
import net.rcenergy.Role;
import net.rcenergy.USState
import net.rcenergy.User
import net.rcenergy.InstrumentTypes
import net.rcenergy.City
import net.rcenergy.Subdivision
import net.rcenergy.Assignment
import net.rcenergy.UserRole;

class BootStrap {

	def init = { servletContext ->
		environments {
			production {
				
			}
			development {
				
				// only create test data if there is no data in DB
				if (USState.count() == 0) {

					def adminRole = new Role(authority: "ROLE_ADMIN").save();					
					def admin = new User(username : "admin", password : "password").save();										
					UserRole.create(admin, adminRole).save();					

					def supervisor = new User(username : "supervisor", password : "password").save();
					def supervisorRole = new Role(authority: "ROLE_SUPERVISOR").save();					
					UserRole.create(supervisor, supervisorRole).save();					
					
					// create two indexers
					def indexer1 = new User(username : "indexer1", password : "password").save();
					def indexerRole = new Role(authority: "ROLE_INDEXER").save();
					UserRole.create(indexer1, indexerRole).save();
					def indexer2 = new User(username : "indexer2", password : "password").save();
					UserRole.create(indexer2, indexerRole).save();

					def reviewer = new User(username : "reviewer", password : "password").save();
					def reviewerRole = new Role(authority: "ROLE_REVIEWER").save();
					UserRole.create(reviewer, reviewerRole).save();
					
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
					def state2 = new USState(name: "OHIO", layout: "layout").save(failOnError: true);
					// create districts
					def district3 = new District(name: "MEIGS", usstate: state2).save(failOnError: true);
					def district1 = new District(name: "OKLAHOMA", usstate: state).save(failOnError: true);
					def district2 = new District(name: "POTTAWATOMIE", usstate: state).save(failOnError: true);
					//create cities
					def city1 = new City(name: "EDMOND", district: district1).save(failOnError: true);
					def city2 = new City(name: "BETHANY", district: district1).save(failOnError: true);
					def city3 = new City(name: "OKLAHOMA CITY", district: district1).save(failOnError: true);
					def city4 = new City(name: "NEWALLA", district: district1).save(failOnError: true);
					def city5 = new City(name: "JONES", district: district1).save(failOnError: true);
					def city6 = new City(name: "HARRAH", district: district1).save(failOnError: true);
					// create subdivisions
					def sub1 = new Subdivision(name: "ORIGINAL MILITARY PARK ADDITION", city:city3).save(failOnError:true);
					def sub2 = new Subdivision(name: "NEW MILITARY PARK ADDITION", city:city3).save(failOnError:true);
					def sub3 = new Subdivision(name: "MILITARY PARK THIRD ADDITION", city:city3).save(failOnError:true);
					def sub4 = new Subdivision(name: "MILITARY PARK VIEW ADDITION", city:city3).save(failOnError:true);
					def sub5 = new Subdivision(name: "AMENDED MILITARY PARK ADDITION", city:city3).save(failOnError:true);
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
					def img1 = new Image(dateLoaded : new Date(), district: district1, image: new File("testImages/image1.png").bytes, bookNumber: 1, pageNumber : 1, fileName: "45837403.png").save(failOnError : true);
					def img2 = new Image(dateLoaded : new Date(), district: district1, image: new File("testImages/image2.png").bytes, bookNumber: 1, pageNumber : 2, fileName: "45837404.png").save(failOnError : true);
					def img3 = new Image(dateLoaded : new Date(), district: district1, image: new File("testImages/image3.png").bytes, bookNumber: 1, pageNumber : 3, fileName: "45837405.png").save(failOnError : true);
					def img4 = new Image(dateLoaded : new Date(), district: district1, image: new File("testImages/image4.png").bytes, bookNumber: 1, pageNumber : 4, fileName: "45837406.png").save(failOnError : true);
					def img5 = new Image(dateLoaded : new Date(), district: district1, image: new File("testImages/image4.png").bytes, bookNumber: 2, pageNumber : 1, fileName: "45837407.png").save(failOnError : true);
					def img6 = new Image(dateLoaded : new Date(), district: district1, image: new File("testImages/image4.png").bytes, bookNumber: 2, pageNumber : 2, fileName: "45837408.png").save(failOnError : true);
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
					def img7 = new Image(dateLoaded : new Date(), district: district1, image: new File("testImages/image1.png").bytes, fileName: "45837409.png").save(failOnError : true).save(failOnError : true);
					def img8 = new Image(dateLoaded : new Date(), district: district1, image: new File("testImages/image2.png").bytes, fileName: "45837410.png").save(failOnError : true).save(failOnError : true);
					def img9 = new Image(dateLoaded : new Date(), district: district1, image: new File("testImages/image3.png").bytes, fileName: "45837411.png").save(failOnError : true).save(failOnError : true);
					def img10 = new Image(dateLoaded : new Date(), district: district1, image: new File("testImages/image4.png").bytes, fileName: "45837412.png").save(failOnError : true).save(failOnError : true);
					
					//assignment
					def assignment1 = new Assignment(district:district1, indexer: indexer1).save(failOnError : true);
					assignment1.images = new ArrayList<Image>();
					assignment1.images.add(img1);
					assignment1.images.add(img2);
					assignment1.images.add(img3);
					assignment1.images.add(img4);
					assignment1.images.add(img5);
					assignment1.images.add(img6);
					assignment1.images.add(img7);
					assignment1.images.add(img8);
					assignment1.images.add(img9);
					assignment1.images.add(img10);
					assignment1.save(failOnError : true);
				}
			}
		}
	}
	def destroy = {
	}
}
