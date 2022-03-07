function animate_boat(sol, bh2o_0)
    # Points in boat coordinate system
    P_boat = [
        0 xmin0 xmax0 xmax
        0 hb hb 0
    ]
    r_o = [xo, zo]
    # Transform to coordinates associated with water level
    r_po = r_o + [0, -bh2o_0]
    # P - point in boat system, y - solution (x, z, θ)
    R(θ) = begin
        sθ, cθ = sincos(θ)
        [cθ -sθ; sθ cθ]
    end
    T = [1 0; 0 -1]
    # From boat reference system to displaced global + reverse of z by T
    to_water(P, x, z, θ) = T * ((r_po + [x, z]) .+ R(θ) * (P .- r_o))

    P_water = [
        -0.1 xmax+0.1 xmax+0.1 -0.1
        0 0 -hb-0.1 -hb-0.1
    ]

    n_frame = 4
    fps = 1 / sol.t[2] / n_frame
    # println("Animaiton with fps=$fps")
    anim = @animate for i = 1:n_frame:length(sol.t)
        x, z, θ = sol[1, i], sol[2, i], sol[3, i]
        P_boat_i = to_water(P_boat, x, z, θ)
        P_water_i = P_water .+ [x, 0]
        P_cm_i = to_water(r_o, x, z, θ)

        plot(
            xlim = (P_water_i[1, 1], P_water_i[1, 2]),
            ylim = (P_water_i[2, 3], 0.2),
            aspect_ratio = 4,
        )
        plot!(Shape(P_boat_i[1, :], P_boat_i[2, :]), opacity = 0.5, color = :orange)
        plot!(Shape(P_water_i[1, :], P_water_i[2, :]), opacity = 0.25, color = :blue)
        plot!(P_cm_i[1, :], P_cm_i[2, :], seriestype = :scatter)
    end
    # gif(anim, "anim_fps$(fps).gif", fps = fps)
    anim, fps
end
