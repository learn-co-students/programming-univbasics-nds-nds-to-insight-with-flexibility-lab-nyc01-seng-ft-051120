# Provided, don't edit
require 'directors_database'

# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

pp directors_database

def flatten_a_o_a(aoa)
  result = []
  i = 0

  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end

  result
end

def movie_with_director_name(director_name, movie_data)
  { 
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end


# Your code after this point

def movies_with_director_key(name, movies_collection)
  movies_with_director = [] 
  row_index = 0 
  
  while row_index < movies_collection.length do 
    movie_index = movies_collection[row_index]
    movies_with_director << movie_with_director_name(name, movie_index)
    row_index += 1 
  end
  movies_with_director
end

def gross_per_studio(collection)
  studio_grosses = {}
  row_index = 0 
  
  while row_index < collection.length do 
    studio_name = collection[row_index][:studio]
    worldwide_gross = collection[row_index][:worldwide_gross]
    if !studio_grosses[studio_name]
      studio_grosses[studio_name] = worldwide_gross.to_i 
    else
      studio_grosses[studio_name] += worldwide_gross.to_i
    end
    row_index += 1 
  end
  studio_grosses
end 

def movies_with_directors_set(source)
  movies_with_directors_listed = [] 
  row_index = 0 
  
  while row_index < source.length do 
    movies_with_directors_listed << movies_with_director_key(source[row_index][:name], source[row_index][:movies])
    row_index += 1 
  end
  movies_with_directors_listed
end

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
