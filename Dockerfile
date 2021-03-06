FROM aegypius/overlay-env

# Portage development utils
# =========================
RUN emerge app-portage/eix
RUN emerge app-portage/gentoolkit

# Install a proper editor
# =======================
RUN emerge app-editors/vim
ENV EDITOR /usr/bin/vi

# Unmask any ~amd64 packages in overlay
# =====================================
RUN echo '*/*::aegypius ~amd64' >> /etc/portage/package.keywords
