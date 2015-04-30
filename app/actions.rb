helpers do
  def current_user
    @current_user = User.find_by(id: session[:user_id]) if session[:user_id]
  end
end

post '/movies/:movie_id/reviews/new' do
  rating = params[:rating]
  text = params[:text]

  @review = Review.create rating: rating, text: text, user_id: current_user.id, movie_id: params[:movie_id]

  redirect "/movie/#{params[:movie_id]}"
end

get '/movies/:movie_id/reviews' do # embedded on: display single movie
  movie = Movie.find(params[:id])
  @reviews = movie.reviews
  # display a list of all reviews associated with @movie

  erb :movie_reviews
end

get '/new/movie' do # New Movie Pair
  erb :new_movie
end

post '/new_movie' do
    director = params[:director]
    lead_actor = params[:lead_actor]
    supporting_actor = params[:supporting_actor]
    genre = params[:genre]
    title = params[:title]
    summary = params[:summary]
    running_time = params[:running_time]
    release_year = params[:release_year]

# binding.pry

      movie = Movie.create(title: title, director: director, lead_actor: lead_actor,supporting_actor: supporting_actor, genre: genre, summary: summary, running_time: running_time, release_year: release_year)

      redirect '/'
end # New Movie pair end

get '/movies' do # list of all movies (possible limit of number)
  @movies = Movie.all
  erb :movies
end

get '/movie/:id' do # Display single movie: contains new_review and review_list
  @movie = Movie.find(params[:id])
  erb :movie
end

# Homepage (Root path)
get '/' do
  erb :index
end

get '/login' do # Login Pair
  erb :login
end

post '/login' do
  email = params[:email]
  password = params[:password]

  # binding.pry

  user = User.find_by(email: email)
  if user && user.password == password
    session[:user_id] = user.id
    redirect '/'
  else
    redirect '/login'
    #might want to change what the result of loggin takes the user to.
  end
end # Login Pair

get '/signup' do # Signup pair - start
  erb :signup
end

post '/signup' do
  username = params[:username]
  password = params[:password]
  firstname = params[:firstname]
  lastname = params[:lastname]
  email = params[:email]

  user = User.find_by(username: username)
    if user
      redirect '/login'
    else
      user = User.create(username: username, password: password, firstname: firstname, lastname: lastname, email: email)
      session[:user_id] = user.id
      redirect '/'
end
    end # Sign up pair - end

# /user/new
# @user= User.new #empty user not saved to db
# erb :user_form
# # in the form imput name="whatever" type="text" value="<% @user.whatever %>
# end

# /user/edit

# erb :user_form
# end

# get '/profile' do
#   erb :profile
# end








