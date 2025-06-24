function correction = sqrt_controller(in)

% error, p, second_ord_limit, dt

% CONSIDERANDO P>0 E SECOND_ORDER_LIMIT>0

glob;
error = in(1);
p = in(2);
second_ord_limit = in(3);

linear_dist = second_ord_limit / p^2;
if error > linear_dist
   correction_rate = sqrt(2.0 * second_ord_limit * (error - (linear_dist/2.0)));
elseif error < -linear_dist
    correction_rate = -sqrt(2.0 * second_ord_limit * (-error - (linear_dist/2.0)));
else
    correction_rate = error * p;
end

if dt>0
    max_rate = abs(error) / dt;
    correction = min(max(correction_rate, -max_rate), max_rate);
else
    correction = correction_rate;
end


