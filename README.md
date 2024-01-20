# jupyter-docker
how to setup your Jupyter notebook to use the environment within a Docker container

```
sudo docker build -t myjupyter .
```

in the Dockerfile we have
```
EXPOSE 8888
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
```


in this example 8888 is the port you exposed the notebook to within your container and 2222 is the remote VM and local port
```
sudo docker run -it -p 2222:8888 \
    -v $(pwd):/home/user \
    myjupyter
```

you will receive a token
```
[I 2024-01-20 06:47:05.470 ServerApp] Jupyter Server 2.12.5 is running at:
[I 2024-01-20 06:47:05.470 ServerApp] http://35e3b764e751:8888/tree?token=d0e97861526c6c4b9db42aa4fc65541c59b966c4139f7339
[I 2024-01-20 06:47:05.470 ServerApp]     http://127.0.0.1:8888/tree?token=d0e97861526c6c4b9db42aa4fc65541c59b966c4139f7339
[I 2024-01-20 06:47:05.470 ServerApp] Use Control-C to stop this server and shut down all kernels (twice to skip confirmation).
[C 2024-01-20 06:47:05.472 ServerApp] 
    
    To access the server, open this file in a browser:
        file:///home/user/.local/share/jupyter/runtime/jpserver-1-open.html
    Or copy and paste one of these URLs:
        http://35e3b764e751:8888/tree?token=d0e97861526c6c4b9db42aa4fc65541c59b966c4139f7339
        http://127.0.0.1:8888/tree?token=d0e97861526c6c4b9db42aa4fc65541c59b966c4139f7339
```

Do this locally:
```
ssh -L 2222:localhost:2222 <user>@<remote_host>
```

go here locally
```
http://localhost:2222/
```

References

[docker](https://www.docker.com/blog/supercharging-ai-ml-development-with-jupyterlab-and-docker/)
[nvidia](https://forums.developer.nvidia.com/t/using-a-jupyter-notebook-within-a-docker-container/60188/4)

