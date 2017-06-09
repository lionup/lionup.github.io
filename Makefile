pull:
	git pull origin master;

push:
	git status -s; git add . -A; git commit -m 'd'; git push origin master;

clean:
	rm -rf machine* slurm* r.output* err.* eval.*;

