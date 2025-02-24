defmodule Rect do
  def intersect(
        {:rect, {:point, x1, y1}, {:point, x2, y2}} = rect1,
        {:rect, {:point, x3, y3}, {:point, x4, y4}} = rect2
      ) do
    unless valid_rect(rect1) do
      raise RuntimeError, "invalid rect 1"
    end

    unless valid_rect(rect2) do
      raise RuntimeError, "invalid rect 2"
    end

    x_overlap = max(x1, x3) < min(x2, x4)
    y_overlap = max(y2, y4) < min(y1, y3)

    x_overlap and y_overlap
  end

  def valid_rect({:rect, {:point, x1, y1}, {:point, x2, y2}}) do
    x1 < x2 and y1 > y2
  end
end
