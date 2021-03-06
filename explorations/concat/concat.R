# also 1:length(x) to seq(along = x)

# Case 1

ans = c()
for(xi in x) {
   ans = c(ans, f(xi))
}

# transform to version that does preallocation:
#
# ans = rep(NA, length(x))
# for(i in seq_along(x)) {
#    ans[i] = f(x[i])
# }

# Then we can make the further transformation into an apply call:
#
# ans = sapply(x, f)

# And possibly a further transformation into a parallel apply:
#
# ans = simplify2array(parallel::mclapply(x, f))

# This might be a nice narrative thread to write about.


ans = integer()
for(i in 1:length(x)) {
   ans[i] = f(x[i])
}

ans = integer()
for(i in 2:length(x)) {
   ans[i] = f(x[i], x[i-1])
}


# start with a single value but still adding to the end of  a vector.
# Looping from 2 onwards.
ans = 0L
for(i in 2:length(x)) {
   ans[i] = f(x[i], ans[i-1])
}

ans = rep(NA, length(x))
ans[1] = 0L
for(i in 2:length(x)) {
   ans[i] = f(x[i], ans[i-1])
}
# Better
for(i in  (seq( along = x[-1])  + 1)) {
   ans[i] = f(x[i], ans[i-1])
}


# Parallel vectors - mapply.
ans = c()
for(i in 1:length(x)) {
   ans = c(ans, f(x[i], y[i]))
}

