using GLMakie

#structs
mutable struct Ball
    x::BigFloat
    y::BigFloat
    vx::BigFloat
    vy::BigFloat
    radius::BigFloat
end

#make window
fig = Figure(
    size = (2560, 1600),
    backgroundcolor = :black
)

ax = Axis(
    fig[1, 1],
    backgroundcolor = :black
)

xlims!(ax, -5, 5)
ylims!(ax, -3, 3)

#time
last_time = time()
current_time = 1/165
time_scale = 1.0

#object
ball = Ball(0.0, 0.0, 2.0, 1.5, 0.3)
ball2 = Ball(0.0, 0.0, 2.1, 1.5, 0.3)
dt = min(current_time - last_time, 1/165)
time_scale = 1.0
frame_time = 1 / 165
#graphicalw
position = Observable([
    Point2f(ball.x, ball.y),
    Point2f(ball2.x, ball2.y)
])

scatter!(
    ax, 
    position,
    markersize = [80, 120],
    color = [:yellow, :green]
    )

    screen = display(fig)

while isopen(screen)
    current_time = time()
    dt = min(current_time - last_time, 0.05)
    global last_time = current_time

    ball.x += ball.vx * dt * time_scale
    ball.y += ball.vy * dt * time_scale

    ball2.x += ball2.vx * dt * time_scale
    ball2.y += ball2.vy * dt * time_scale
    
    #collision
    #ball1
    if ball.x >= 5
        ball.x = 5
        ball.vx = -ball.vx
    end
    if ball.x <= -5
        ball.x = -5
        ball.vx = -ball.vx
    end

    if ball.y <= -3
        ball.y = -3
        ball.vy = -ball.vy
    end
    
    if ball.y >= 3
        ball.y = 3
        ball.vy = -ball.vy
    end

    #ball2
    if ball2.x >= 5
        ball2.x = 5
        ball2.vx = -ball2.vx
    end
    if ball2.x <= -5
        ball2.x = -5
        ball2.vx = -ball2.vx
    end

    if ball2.y <= -3
        ball2.y = -3
        ball2.vy = -ball2.vy
    end
    
    if ball2.y >= 3
        ball2.y = 3
        ball2.vy = -ball2.vy
    end

    position[] = [
        Point2f(ball.x, ball.y),
        Point2f(ball2.x, ball2.y)
    ]
    sleep(frame_time)
end