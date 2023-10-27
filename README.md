# The Office

This is a demo rails API application with JWT authenticaiton that exposes CRUD endpoings to manage employees.

## Setup

In order to set up the project just download this repo and run the following commands:

1. Install the dependencies: `bundle install`
2. We need to set up the database. It automatically feeds some data so that we can use the project right away.
`bin/rails db:setup`
3. Start the server: `bin/rails s`


## Usage

I have created mocked data that are persisted in the database that we can query against.

To use the application you can use an API client like [insomnia](https://insomnia.rest/)
###Endpoints

#### #login
First we need to authenticate.
I have created a dummy user with these credentials:

`POST http://localhost:3000/login`

Params:

```
  email: "me@email.me"
  password: "password1!"
```

![login](https://imageupload.io/ib/R4sOWtyt16LPbnz_1698411631.png)

#### #tenant
We can get our tenant info here:

`GET http://localhost:3000/api/v1/tenants`

![login](https://imageupload.io/ib/LimFDGWya3jSSiT_1698412314.png)

#### #employees
We can get our tenant's employees info here:

`GET http://localhost:3000/api/v1/employees`

This endpoint also support pagination and search functionality.
For pagination we are using url params and in the headers we can see in what page we currently are and what the totals are:

`GET http://localhost:3000/api/v1/employees?page=5`

![login](https://imageupload.io/ib/3PHRFY2hAVaXFbT_1698411631.png)

This functionality can also be combined with the searching functionality.
In order to search we can still use url params to narrow down the results.

Examples:

`GET http://localhost:3000/api/v1/employees?name=Minh`

![login](https://imageupload.io/ib/tdaoEgCiwLmDJtI_1698411631.png)

`GET http://localhost:3000/api/v1/employees?role=sales&page=5`

![login](https://imageupload.io/ib/3PHRFY2hAVaXFbT_1698411631.png)


#### employee #create
We can create new employees:

`POST http://localhost:3000/api/v1/employees`

Params:

```
{
  "name": "Michael Scott",
  "role": "sales",
  "email": "michael@dsd.com",
  "tenant_id": "1"
}

```


#### employee #update
We can create new employees:

`PATCH http://localhost:3000/api/v1/employees/1`

Params:

```
{
  "name": "Michael Scott",
  "role": "sales",
}
```

#### employee #destroy
We can create new employees:

`DELETE http://localhost:3000/api/v1/employees/1`



## Test

In order to run the tests we just have to run:

`rspec`

