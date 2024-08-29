FROM osrf/ros:humble-desktop-full

# Install nano, vim, and required packages
RUN apt-get update && apt-get install -y \
    nano \
    vim \
    sudo \
    ros-humble-gazebo-ros-pkgs \
    && rm -rf /var/lib/apt/lists/*

# Define arguments
ARG USERNAME=ros
ARG USER_ID=1000
ARG USER_GID=${USER_ID}

# Add user and group
RUN groupadd --gid ${USER_GID} ${USERNAME} \
    && useradd -s /bin/bash --uid ${USER_ID} --gid ${USER_GID} -m ${USERNAME} \
    && mkdir -p /home/${USERNAME}/.config \
    && chown ${USER_ID}:${USER_GID} /home/${USERNAME}/.config

# Configure sudo for the new user
RUN echo "${USERNAME} ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/${USERNAME} \
    && chmod 0440 /etc/sudoers.d/${USERNAME}

# Copy configuration files
COPY confid/ /site_config/
COPY entrypoint.sh /entrypoint.sh
COPY bashrc /home/${USERNAME}/.bashrc

# Set the user for the container
USER ${USERNAME}

# Set the entrypoint and default command
ENTRYPOINT [ "/bin/bash", "/entrypoint.sh" ]
CMD ["bash"]
