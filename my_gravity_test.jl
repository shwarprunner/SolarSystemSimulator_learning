using GLMakie

#structs
mutable struct Ball
    x::Float64
    y::Float64
    vx::Float64
    vy::Float64
    radius::Float64
end

#make window
fig = Figure(
    size = (1000, 700),
    backgroundcolor = :black
)

ax = Axis(
    fig[1, 1],
    backgroundcolor = :black
)

xlims!(ax, -5, 5)
ylims!(ax, -3, 3)

#time
dt = 1/165

#ball
ball = Ball(0.0, 2.0, 0.0, 0.0, 0.3)

#physics
gravity = -9.81
floor_y = -2.5
bounce = 0.99

#values for GLMakie
ball_x = Observable(ball.x)
ball_y = Observable(ball.y)

scatter!(
    ax,
    ball_x,
    ball_y,
    markersize = 40
)

#floor
lines!(
    ax,
    [-5, 5],
    [floor_y, floor_y],
    linewidth = 4
)

screen = display(fig)

last_time = time()

while isopen(screen)
    #time shenanigans
    current_time = time()
    dt = min(current_time - last_time, 0.05)
    global last_time = current_time

    #moving ball
    ball.vy += gravity * dt
    ball.y += ball.vy * dt

    #collision
    if ball.y - ball.radius <= floor_y
        ball.y = floor_y + ball.radius

        if ball.vy < 0
            ball.vy = -ball.vy * bounce
        end
    end

    #update drawing
    ball_x[] = ball.x
    ball_y[] = ball.y

    sleep(1/165)
end