# Nu-Rumie
![Build Status](https://codeship.com/projects/e2ab7750-e4de-0134-56a3-260381cb9a2f/status?branch=master)
[![Code Climate](https://codeclimate.com/github/DBombay/nu-rumie/badges/gpa.svg)](https://codeclimate.com/github/DBombay/nu-rumie)


#About

Nu-Rumie is a Ruby 2.3.3 web app built to help people find roommates with similar interests! I'm still building it, so there isn't much to know about just yet. But I promise I'll update the ReadMe as the project scales!

#Current Features

- Devise Authentication for users
- Foundation CSS
- React.js front-end
- Rails 5 back-end
- ActiveRecord PSQL database usage
- Profile photos hosted through S3 AWS, and uploaded with CarrierWave
- integrates Google Maps API

#Admin

- Admins are set by boolean, and must be seeded with admin as 'true'.
- Admins can delete and edit rumie groups

#Users

- Users can create groups and set their sizes.
- Users that create a group have admin privileges over their group, and can eject others
