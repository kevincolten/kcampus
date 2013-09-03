# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or newd alongside the db with db:setup).
#
# Examples:
#
#   cities = City.new([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.new(name: 'Emanuel', city: cities.first)

@client = Client.new( :fname => "Kevin",
                          :lname => "Col",
                          :organization => "ACC",
                          :email => "kevin@hello.com",
                          :phone => "0123456789" )

@client.save

@user = User.new( :email => @client.email,
                      :password => "hello2",
                      :client_id => @client.id,
                      :client => true )

@user.save

@location1 = Location.new( :code => "HBC",
                              :name => "Highland Business Center",
                              :address => "Middle Fiskville Rd",
                              :city => "Austin",
                              :state => "TX",
                              :zipcode => "78702",
                              :contact_name => "Kathy",
                              :contact_phone => "1234567890",
                              :contact_email => "kathy@hello.com",
                              :client_id => @client.id )

@location1.save

@location2 = Location.new( :code => "RVS",
                              :name => "Riverside Campus",
                              :address => "Grove Blvd",
                              :city => "Austin",
                              :state => "TX",
                              :zipcode => "78741",
                              :contact_name => "Bill",
                              :contact_phone => "1234567890",
                              :contact_email => "bill@hello.com",
                              :client_id => @client.id )                              
                              
@location2.save

@course_type1 = CourseType.new( :long_name => "Math Core Strength Plus",
                                   :short_name => "Math CS Plus",
                                   :discipline => "GEDM",
                                   :level => 3,
                                   :client_id => @client.id )
                                   
@course_type1.save

@course_type2 = CourseType.new( :long_name => "Math Application",
                                   :short_name => "Math App",
                                   :discipline => "GEDM",
                                   :level => 4,
                                   :client_id => @client.id )
                                   
@course_type2.save

@instructor1 = Instructor.new( :fname => "David",
                                  :lname => "Lee",
                                  :idn => 1234567,
                                  :location_id => @location1.id,
                                  :phone => "1234567890",
                                  :email => "david@hello.com",
                                  :pay_rate => 12.50,
                                  :client_id => @client.id )
                                  
@instructor1.save

@instructor2 = Instructor.new( :fname => "Colten",
                                  :lname => "Sanders",
                                  :idn => 7654321,
                                  :location_id => @location2.id,
                                  :phone => "1234567890",
                                  :email => "colten@hello.com",
                                  :pay_rate => 17.50,
                                  :client_id => @client.id )

@instructor2.save

@term = Term.new( :semester => "Fall",
                  :code => "131F",
                  :year => "2013",
                  :number => "2",
                  :reg_start => "2013-09-30",
                  :reg_end => "2013-10-11",
                  :start => "2013-10-14",
                  :end => "2013-12-06",
                  :add_drop_end => "2013-11-08",
                  :client_id => @client.id )
                  
@term.save

@course1 = Course.new( "synonym"=>"123456", 
                       "course_type_id"=> @course_type1.id, 
                       "section"=>"02", 
                       "term_id"=> @term.id, 
                       "location_id"=> @location1.id, 
                       "number"=>"02", 
                       "instructor_id"=> @instructor1.id, 
                       "monday"=>"true", 
                       "wednesday"=>"true", 
                       "friday"=>"true", 
                       "start_time"=>"09:00", 
                       "end_time"=>"10:30", 
                       "room_number"=>" 123", 
                       "min_seats"=>"1", 
                       "max_seats"=>"15", 
                       "budget_code"=>"80001", 
                       "client_id"=> @client.id)

@course1.save

@course2 = Course.new( "synonym"=>"654321", 
                       "course_type_id"=> @course_type1.id, 
                       "section"=>"02", 
                       "term_id"=> @term.id, 
                       "location_id"=> @location2.id, 
                       "number"=>"02", 
                       "instructor_id"=> @instructor1.id, 
                       "tuesday"=>"true", 
                       "thursday"=>"true", 
                       "start_time"=>"18:00", 
                       "end_time"=>"21:30", 
                       "room_number"=>" 321", 
                       "min_seats"=>"1", 
                       "max_seats"=>"15", 
                       "budget_code"=>"80001", 
                       "client_id"=> @client.id)

@course2.save

@admin1 = Admin.new( "idn"=>"3456789", 
                     "fname"=>"Zach", 
                     "lname"=>"Sartin", 
                     "phone"=>"1234567890", 
                     "email"=>"zach@hello.com", 
                     "location_id"=> @location1.id, 
                     "client_id"=> @client.id)
                     
@admin1.save
                     
@admin2 = Admin.new( "idn"=>"9876543", 
                     "fname"=>"Doug", 
                     "lname"=>"Jones", 
                     "phone"=>"1234567890", 
                     "email"=>"doug@hello.com", 
                     "location_id"=> @location2.id, 
                     "client_id"=> @client.id)
                     
@admin2.save