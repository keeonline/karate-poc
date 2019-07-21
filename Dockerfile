FROM centos:7
RUN sed -i 's/umask 002/umask 000/g' /etc/bashrc
RUN sed -i 's/umask 022/umask 000/g' /etc/bashrc
RUN useradd -ms /bin/bash newuser
RUN echo "newuser:newuser" | chpasswd
CMD /bin/bash
