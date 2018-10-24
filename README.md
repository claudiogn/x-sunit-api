# X-SUNIT (Extraterrestrial Survival Unit) - API
The world as we know it has fallen into an apocalyptic scenario. An alien invasion is abducting humans and swapping them for evil clones that look really similar to the original person.

This is the REST API is responsible for share resources between non-abducted humans.

#Requirements
* Ruby 2.3.4
* Rails 5.1.6
* SQLite 3.10

# Survivor
Survivor model represents the humans during the attacks. 

Survivor attributes:

* name `(String)`: Survivor's name  
* age `(Integer)`: Survivor's age
* gender `(String)`: Survivor's gender, possible values: `male`, `female` and `others` 
* latitude `(Decimal)`: Survivor location latitude 
* longitude `(Decimal)`: Survivor location longitude
* flags `(Integer)`: Number of times this survivor was reported as abducted
* abducted `(Boolean)`: If the survivor was abducted this field is set to True. A survivor is considered abducted when `flags>=3`

#Endpoints
* `GET /survivors` Lists all registered survivors, orderned by name, with all their parameters. If you want choose the reponse attributes, add a query and paginate the list, add some parameters to the URL:
    * `/survivors?query_field` Set the field you want to filter and its value. Exemple: `/survivors?gender=female&age=33`
    OBS: If you want to use query by name you should use `/survivors?by_name=doe`
    * `/survivors?fields` Set the fields you want to display. Exemple: `/survivors?fields=name,abducted`
    * `/survivors?per_page` Set the number of records you want to return per the page. Exemple `/survivors?per_page=3`
    * `/survivors?page` Set the page you want to return. Exemple `/survivors?per_page=3`
* `POST /survivors` Create a new Survivor by sending a JSON on this format: `"survivor":{"name": "name", "age": "age", "gender": "gender", "latitude": "latitude", "longitude":"longitude"}`. No need to send `flags` and `abducted` attributes, since they have default values (0 and False). 
* `GET /survivors/:id` Return the Survivor that has id: `:id`
* `PATCH/PUT /survivors/:id` Update survivor's latitude and longitude by sending a JSON on this format: `"survivor":{"latitude": "latitude", "longitude": "longitude"}`
* `DELETE /survivors/:id` Delete the survivor that has the id: `:id`
* `POST /survivors/:id/report` Reports the survivor that has id: `:id` as abducted. This survivor will be truly considered abducted after being reported 3 times. No data need to be sent
* `survivors/statistics` Return percentage of abducted and non-abducted survivors

# Data
If you want to add some survivors for testing purpose just run `rails db:seed`