FROM directus/directus:10.8.2

USER root
RUN corepack enable

USER node

# install extension
RUN pnpm install @purnasatria/directus-extension-document-interface
RUN pnpm install directus-extension-currency-interface
RUN pnpm install directus-extension-computed-interface

