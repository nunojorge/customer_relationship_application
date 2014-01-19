
class Rolodex
	def initialize
		@contacts  =  []
		@id = 1000
	end

	def contacts
		@contacts
	end

	def add_new_contact
		@id +=1
	  	print "Enter First Name: "
	  	first_name = gets.chomp
	  	print "Enter Last Name: "
	  	last_name = gets.chomp
	  	print "Enter Email Address: "
	  	email = gets.chomp
	  	print "Enter a Note: "
	  	note = gets.chomp
	  	contact = Contact.new(1,first_name, last_name, email, note)
		@contacts << Contact.new(@id, contact.first_name, contact.last_name, contact.email, contact.note)
		@contacts.last
	end

	def modify_existing_contact
		print "Enter contact id: "
		id = gets.chomp.to_i
		print "Enter attribute tag to be modified(first_name, last_name, email, note): "
		attribute  = gets.chomp
		print "Enter new attribute: "
		new_attribute = gets.chomp
		contact = find_contact(id)
		contact.first_name = new_attribute if attribute == "first_name"
		contact.last_name = new_attribute if attribute == "last_name"
		contact.email = new_attribute if attribute == "email"
		contact.note = new_attribute  if attribute == "note"

	end

	def delete_contact
		print "Enter contact id: "
		id = gets.chomp.to_i
		contact = find_contact(id)
		@contacts.delete(contact)
	end

	def display_all_the_contacts
		@contacts.each { |contact|
			puts contact.id.to_s+" "+contact.first_name+" "+contact.last_name+" "+contact.email+" "+contact.note
		}

	end

	def display_attribute
		print "Enter contact id: "
		id = gets.chomp.to_i
		print "Enter attribute tag (first_name, last_name, email, note: )"
		attribute  = gets.chomp
		contact = find_contact(id)
		puts contact.first_name if attribute == "first_name"
		puts contact.last_name if attribute == "last_name"
		puts contact.email if attribute == "email"
		puts contact.note if attribute == "note"

	end

	def find_contact(id)
		return nil if @contacts.empty?
		@contacts.each do |contact|
			return contact if contact.id == id
		end
	end
end