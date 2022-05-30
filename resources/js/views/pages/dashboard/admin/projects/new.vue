<template>
  <main class="flex-1 relative overflow-y-auto py-6 focus:outline-none" tabindex="0">
    <form @submit.prevent="saveProject">
      <div class="max-w-7xl mx-auto sm:px-6 lg:px-8 px-5">
        <div class="md:flex md:items-center md:justify-between">
          <div class="flex-1 min-w-0">
            <h1 class="py-0.5 text-2xl font-semibold text-gray-900">
              {{ $t("Create project") }}
            </h1>
          </div>
        </div>
      </div>
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="mt-6 shadow sm:rounded-lg">
          <loading :status="loading" />
          <div class="bg-white md:grid md:grid-cols-3 md:gap-6 px-4 py-5 sm:p-6">
            <div class="md:col-span-1">
              <h3 class="text-lg font-medium leading-6 text-gray-900">
                {{ $t("Project details") }}
              </h3>
              <p class="mt-1 text-sm leading-5 text-gray-500">
                {{ $t("Project details") }}.
              </p>
            </div>
            <div class="mt-5 md:mt-0 md:col-span-2">
              <div class="grid grid-cols-3 gap-6">
                <div class="col-span-3">
                  <label
                    class="block text-sm font-medium leading-5 text-gray-700"
                    for="project_title"
                    >{{ $t("Project Title") }}</label
                  >
                  <div class="mt-1 relative rounded-md shadow-sm">
                    <input
                      id="project_title"
                      v-model="project.project_title"
                      :placeholder="$t('Project Title')"
                      class="form-input block w-full transition duration-150 ease-in-out sm:text-sm sm:leading-5"
                      required
                    />
                  </div>
                </div>
                <div class="col-span-3">
                  <label
                    class="block text-sm font-medium leading-5 text-gray-700"
                    for="description"
                    >{{ $t("Description") }}</label
                  >
                  <div class="mt-1 relative rounded-md shadow-sm">
                    <input
                      id="description"
                      v-model="project.description"
                      :placeholder="$t('Description')"
                      class="form-input block w-full transition duration-150 ease-in-out sm:text-sm sm:leading-5"
                      required
                    />
                  </div>
                </div>
                <div class="col-span-3">
                  <label
                    class="block text-sm font-medium leading-5 text-gray-700"
                    for="status"
                    >{{ $t("Status") }}</label
                  >
                  <div class="mt-1 relative rounded-md shadow-sm">
                <select
                  id="status"
                  v-model="project.status"
                  class="mt-1 block form-select w-full py-2 px-3 border border-gray-300 bg-white rounded-md shadow-sm focus:outline-none focus:shadow-outline-blue focus:border-blue-300 transition duration-150 ease-in-out sm:text-sm sm:leading-5"
                  required
                >
                  <option :value="null" disabled>{{ $t("Select an option") }}</option>
                  <option v-for="status in statusList" :value="status.id">
                    {{ status.name }}
                  </option>
                </select>
                  </div>
                </div>
                <div class="col-span-3">
                  <label
                    class="block text-sm font-medium leading-5 text-gray-700"
                    for="company"
                    >{{ $t("Company") }}</label
                  >
                  <div class="mt-1 relative rounded-md shadow-sm">
                    <select
                      id="company"
                      v-model="project.company_id"
                      class="mt-1 block form-select w-full py-2 px-3 border border-gray-300 bg-white rounded-md shadow-sm focus:outline-none focus:shadow-outline-blue focus:border-blue-300 transition duration-150 ease-in-out sm:text-sm sm:leading-5"
                      required
                    >
                      <option :value="null" disabled>{{ $t("Select an option") }}</option>
                      <option v-for="company in companies" :value="company.id">
                        {{ company.name }}
                      </option>
                    </select>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="bg-gray-100 text-right px-4 py-3 sm:px-6">
            <span class="inline-flex">
              <router-link
                class="btn btn-secondary shadow-sm rounded-md mr-4"
                to="/dashboard/admin/projects"
              >
                {{ $t("Cancel") }}
              </router-link>
              <button class="btn btn-green shadow-sm rounded-md" type="submit">
                {{ $t("Create project") }}
              </button>
            </span>
          </div>
        </div>
      </div>
    </form>
  </main>
</template>

<script>
export default {
  name: "new",
  metaInfo() {
    return {
      title: this.$i18n.t("Create project"),
    };
  },
  data() {
    return {
      loading: false,
      companies: [],
      project: {
        project_title: null,
        description: null,
        status: 1,
        company_id: null
      },
      statusList: [],
    };
  },
  mounted() {
    this.getCompanies();
    this.getStatuses();
  },
  methods: {
    saveProject() {
      const self = this;
      self.loading = true;
      axios
        .post("api/dashboard/admin/projects", self.project)
        .then(function (response) {
          self.loading = false;
          self.$notify({
            title: self.$i18n.t("Success").toString(),
            text: self.$i18n.t("Data saved correctly").toString(),
            type: "success",
          });
          self.$router.push(
            "/dashboard/admin/projects/" + response.data.project.id + "/edit"
          );
        })
        .catch(function () {
          self.loading = false;
        });
    },
    getCompanies() {
      const self = this;
      self.loading = true;
      axios
        .get("api/dashboard/admin/projects/companies")
        .then(function (response) {
          self.companies = response.data;
          self.loading = false;
        })
        .catch(function () {
          self.loading = false;
        });
    },
    getStatuses() {
      const self = this;
      self.loading = true;
      axios
        .get("api/dashboard/admin/projects/statuses")
        .then(function (response) {
          self.statusList = response.data;
          self.loading = false;
        })
        .catch(function () {
          self.loading = false;
        });
    },
  },
};
</script>
