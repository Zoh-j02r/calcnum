FROM julia
RUN useradd -u 5000 --create-home --home-dir /home/julia julia && \
	echo "julia ALL=(ALL) NOPASSWD: ALL" | tee -a /etc/sudoers
USER julia
RUN cd /home/julia && mkdir assignments
