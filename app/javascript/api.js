import axios from 'axios';

const httpClient = axios.create({
  baseURL: 'http://localhost:3000/'
});

export const getProjectsList = () =>
  httpClient.get('/projects')

export const createNewProject = () =>
  httpClient.post('/projects')

export const destroyProject = (id) =>
  httpClient.delete(`/projects/${id}`)

export const updateProject = (id, title) =>
  httpClient.patch(`/projects/${id}`, { title })

export const createNewTask = (projectId, text) =>
  httpClient.post(`/projects/${projectId}/tasks`, { text })

export const destroyTask = (taskId) =>
  httpClient.delete(`/tasks/${taskId}`)

export const updateTask = (taskId, params) =>
  httpClient.patch(`/tasks/${taskId}`, params)
