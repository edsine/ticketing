<?php

namespace App\Http\Controllers\Api\Dashboard\Admin;

use Exception;
use App\Models\Company;
use App\Models\Project;
use App\Models\Department;
use Illuminate\Http\JsonResponse;
use App\Http\Controllers\Controller;
use App\Http\Resources\Company\CompanyResource;
use App\Http\Requests\Dashboard\Admin\Company\StoreRequest;
use App\Http\Requests\Dashboard\Admin\Company\UpdateRequest;

class CompanyController extends Controller
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
    public function index(): JsonResponse
    {
        return response()->json(CompanyResource::collection(Company::all()));
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
        $company = new Company();
        $company->name = $request->get('name');
        $company->acronym = $request->get('acronym');
        if ($company->save()) {
            return response()->json(['message' => 'Data saved correctly', 'company' => new CompanyResource($company)]);
        }
        return response()->json(['message' => __('An error occurred while saving data')], 500);
    }

    /**
     * Display the specified resource.
     *
     * @param  Company  $company
     * @return JsonResponse
     */
    public function show(Company $company): JsonResponse
    {
        return response()->json(new CompanyResource($company));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  UpdateRequest  $request
     * @param  Department  $department
     * @return JsonResponse
     */
    public function update(UpdateRequest $request, Company $company): JsonResponse
    {
        $request->validated();
        $company->name = $request->get('name');
        $company->acronym = $request->get('acronym');
        if ($company->save()) {
            return response()->json(['message' => 'Data updated correctly', 'company' => new CompanyResource($company)]);
        }
        return response()->json(['message' => __('An error occurred while saving data')], 500);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  Company  $company
     * @return JsonResponse
     * @throws Exception
     */
    public function destroy(Company $company): JsonResponse
    {
        Project::where('company_id', $company->id)->update(['company_id' => null]);
        if ($company->delete()) {
            return response()->json(['message' => 'Data deleted successfully']);
        }
        return response()->json(['message' => __('An error occurred while deleting data')], 500);
    }

}
