randomwalk = function(steps){
  rads = runif(steps, min=0, max=6.28)
  x = cos(rads[1])
  y = sin(rads[1])
  for(i in 2:length(rads)){
    x[i] = cos(rads[i]) + x[i-1]
    y[i] = sin(rads[i]) + y[i-1]
  }
  df = data.frame(x = x, y = y)
}