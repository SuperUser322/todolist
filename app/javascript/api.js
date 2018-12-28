import axios from 'axios';
const httpClient = axios.create({
  baseURL: 'http://localhost:3000/'
});
export const getProjectsList = () =>
httpClient.get('/projects')

export const createNewProject = () =>
httpClient.post('/projects')

export const handleDestroyProject = (id) =>
httpClient.delete(`/projects/${id}`)
