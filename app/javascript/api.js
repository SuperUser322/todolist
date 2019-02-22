import axios from 'axios';
const httpClient = axios.create({
  baseURL: 'http://localhost:3000/'
});

export const getProjectsList = () =>
httpClient.get('/projects')

export const handleCreateNewProject = () =>
httpClient.post('/projects')

export const handleDestroyProject = (id) =>
httpClient.delete(`/projects/${id}`)

export const updateProject = (id, title) =>
httpClient.patch(`/projects/${id}`, {title})
