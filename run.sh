dataset="bdp"

models=(
	# "s6"
	# "e6"
	# "p6"
	# "d6"
	# "h2,h2,h2"
	# "d2,e2,p2"
	# "d2,e2,p2"
	# "u2,u2,u2"
	# "u6"
	"u1,u1,u1,u1,u1,u1"
)

fix_curs=(
	# "True"
	# "True"
	# "True"
	# "False"
	# "False"
	# "False"
	# "True"
	# "False"
	"False"
)

univs=(
	# "False"
	# "False"
	# "False"
	# "False"
	# "False"
	# "False"
	# "False"
	# "True"
	"True"
)
unif="True"

# export CUDA_VISIBLE_DEVICES=7,5,2,3

for i in ${!models[@]}; do
	model=${models[$i]}
	fix_cur=${fix_curs[$i]}
	univ=${univs[$i]}
	echo $model, $fix_cur, $univ

	# python -m mt.examples.run \
	python -m mt.examples.run \
		--dataset=$dataset \
		--model=$model \
		--fixed_curvature=$fix_cur \
		--universal=$univ \
		--scalar_parametrization=$unif \
		2>&1 | tee "log/$dataset-$model-$fix_cur-$univ-$unif.txt"
	# --batch_size=100 \
	# --epochs=15 \
	# --warmup=10 \
	# --lookahead=5 \
done
