defmodule Distance do
  def distance({:point, x1, y1}, {:point, x2, y2}) do
    (:math.pow(x1 - x2, 2) + :math.pow(y1 - y2, 2))
    |> :math.sqrt()
    |> Float.round()
  end

  def point_inside_figure?(point, {:circle, center, radius}) do
    distance(point, center) <= radius
  end

  def point_inside_figure?({:point, x, y}, {:rect, tl, br}) do
    {:point, left_x, top_y} = tl
    {:point, right_x, bottom_y} = br
    # dbg({top_y, y, bottom_y})
    x <= right_x and x >= left_x and y >= top_y and y <= bottom_y
  end
end

ExUnit.start()

defmodule DistanceTest do
  use ExUnit.Case
  import Distance

  test "Distance test" do
    assert distance({:point, 0, 0}, {:point, 100, 100}) == 141
    assert distance({:point, 10, 10}, {:point, 40, 50}) == 50
    refute distance({:point, 10, 10}, {:point, 40, 50}) == 51
  end

  test "distance crash" do
    p = {:point, 10, 1000}
    r = {:rect, {:point, 5, 5}, {:point, 50, 50}}
    assert_raise FunctionClauseError, fn -> distance(p, r) end
  end

  test "Point inside circle" do
    p1 = {:point, 10, 10}
    p2 = {:point, 10, 100}
    p3 = {:point, 10, 1000}
    c = {:circle, {:point, 5, 5}, 20}

    assert point_inside_figure?(p1, c)
    refute point_inside_figure?(p2, c)
    refute point_inside_figure?(p3, c)
  end

  test "Point inside rectangle" do
    p1 = {:point, 10, 10}
    p2 = {:point, 10, -50}
    p3 = {:point, 10, 1000}
    r = {:rect, {:point, 5, 5}, {:point, 50, 50}}

    assert point_inside_figure?(p1, r)
    refute point_inside_figure?(p2, r)
    refute point_inside_figure?(p3, r)
  end

  test "point inside figure crash" do
    p0 = {:point, 0, 0}
    p1 = {:point, 10, 10}
    p2 = {:point, 10, -50}
    p3 = {:point, 10, 1000}
    t = {:triangle, p1, p2, p3}
    assert_raise FunctionClauseError, fn -> point_inside_figure?(p0, t) end
  end
end
