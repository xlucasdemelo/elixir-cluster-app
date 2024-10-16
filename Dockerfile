# Dockerfile

# Use the official Elixir image
FROM elixir:1.14

# Set the working directory inside the container
WORKDIR /app

# Copy the project files into the working directory
COPY . .

# Install dependencies
RUN mix local.hex --force && mix local.rebar --force
RUN mix deps.get

# Set the default command to run when the container starts
CMD ["sh", "-c", "iex --sname $ELIXIR_NODE_NAME --cookie my_secret_cookie -S mix run --no-halt"]
# CMD ["iex", "--sname", "$ELIXIR_NODE_NAME", "--cookie", "my_secret_cookie", "-S", "mix", "run", "--no-halt"]