rails generate migration CreateWeather date:datefield temperature:array
rails generate migration CreateLocation state:string city:string latitude:string longitude:string 
rails generate migration AddLocationRefToWeather location:references