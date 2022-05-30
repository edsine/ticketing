<?php

namespace App\Http\Controllers\Api\Dashboard\Admin;

use App\Enums\ProjectEnum;
use Exception;
use App\Models\Company;
use App\Models\Project;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use App\Http\Controllers\Controller;
use App\Http\Resources\Project\ProjectResource;
use App\Http\Resources\Company\CompanySelectResource;
use App\Http\Resources\Project\ProjectDetailsResource;
use App\Http\Requests\Dashboard\Admin\Project\StoreRequest;
use App\Http\Requests\Dashboard\Admin\Project\UpdateRequest;

class ProjectController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:sanctum');
    }

    /**
     * Display a listing of the resource.
     *
     * @return JsonResponse
     */
    public function index(Request $request): JsonResponse
    {
        $sort = json_decode($request->get('sort', json_encode(['order' => 'asc', 'column' => 'created_at'], JSON_THROW_ON_ERROR)), true, 512, JSON_THROW_ON_ERROR);
        $items = Project::filter($request->all())
            ->orderBy($sort['column'], $sort['order'])
            ->paginate((int) $request->get('perPage', 10));
        return response()->json([
            'items' => ProjectResource::collection($items->items()),
            'pagination' => [
                'currentPage' => $items->currentPage(),
                'perPage' => $items->perPage(),
                'total' => $items->total(),
                'totalPages' => $items->lastPage()
            ]
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  StoreRequest  $request
     * @return JsonResponse
     */
    public function store(StoreRequest $request): JsonResponse
    {
        $request->validated();
        $project = new Project();
        $project->project_title = $request->get('project_title');
        $project->description = $request->get('description');
        $project->status = $request->get('status');
        $project->company_id = $request->get('company_id');
        if ($project->save()) {
            return response()->json(['message' => 'Data saved correctly', 'project' => new ProjectResource($project)]);
        }
        return response()->json(['message' => __('An error occurred while saving data')], 500);
    }

    /**
     * Display the specified resource.
     *
     * @param  Project  $project
     * @return JsonResponse
     */
    public function show(Project $project): JsonResponse
    {
        return response()->json(new ProjectResource($project));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  UpdateRequest  $request
     * @param  Department  $department
     * @return JsonResponse
     */
    public function update(UpdateRequest $request, Project $project): JsonResponse
    {
        $request->validated();
        $project->project_title = $request->get('project_title');
        $project->description = $request->get('description');
        $project->status = $request->get('status');
        $project->company_id = $request->get('company_id');
        if ($project->save()) {
            return response()->json(['message' => 'Data updated correctly', 'project' => new ProjectResource($project)]);
        }
        return response()->json(['message' => __('An error occurred while saving data')], 500);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  Project  $project
     * @return JsonResponse
     * @throws Exception
     */
    public function destroy(Project $project): JsonResponse
    {
        if ($project->delete()) {
            return response()->json(['message' => 'Data deleted successfully']);
        }
        return response()->json(['message' => __('An error occurred while deleting data')], 500);
    }

    public function companies(): JsonResponse
    {
        return response()->json(CompanySelectResource::collection(Company::all()));
    }

    public function statuses(): JsonResponse
    {
        $statusList = (new ProjectEnum)->statuses();
        return response()->json($statusList);
    }

}
