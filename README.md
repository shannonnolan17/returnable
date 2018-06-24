###Returnable

- An app to help ease the pain of returning things bought from online for everyone!
- A full rails application that utilizes Pitney Bowes shipping API as well as FreshDesk's API 
- We used Pitney Bowes 'Create a Label' API to create a return shipping label for customers
- We used FreshDesk to create tickets for the merchant to view when a customer returns an item
- We plan on being abe to integrate this into 'shopify' or 'wordpress' apps so merchants can use it

###How to run

####need rails

`bundle install`
`rails db:create`
`rails db:migrate`
`rails s`
